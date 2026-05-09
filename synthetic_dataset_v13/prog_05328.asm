; DESCRIPTION: Composite: Draws a blue circle centered at (121, 161) with radius 59 then Renders a magenta box of size 82x45 starting at (14, 146) then Places a cyan dot at position (448, 215).
; PLAN: r0=121(x), r1=161(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x), r6=146(y), r7=82(width), r8=45(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=448(x), r11=215(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 161
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 146
LDI r7, 82
LDI r8, 45
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 215
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
