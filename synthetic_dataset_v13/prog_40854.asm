; DESCRIPTION: Composite: Draws a blue rectangle at (218, 62) with width 24 and height 97 then Renders a cyan line between points (243, 34) and (52, 210) then Places a magenta dot at position (173, 146).
; PLAN: r0=218(x), r1=62(y), r2=24(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x1), r6=34(y1), r7=52(x2), r8=210(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=173(x), r11=146(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 62
LDI r2, 24
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 34
LDI r7, 52
LDI r8, 210
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 146
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
