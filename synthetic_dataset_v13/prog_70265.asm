; DESCRIPTION: Composite: Sets a single magenta pixel at (315, 251) then Draws a white rectangle at (53, 128) with width 92 and height 32 then Renders a cyan line between points (479, 102) and (243, 173).
; PLAN: r0=315(x), r1=251(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=53(x), r6=128(y), r7=92(width), r8=32(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x1), r11=102(y1), r12=243(x2), r13=173(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 251
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 53
LDI r6, 128
LDI r7, 92
LDI r8, 32
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 102
LDI r12, 243
LDI r13, 173
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
