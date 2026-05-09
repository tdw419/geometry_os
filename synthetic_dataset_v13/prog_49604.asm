; DESCRIPTION: Composite: Places a cyan circle of radius 64 at center (350, 150) then Renders a magenta box of size 85x23 starting at (250, 160) then Places a red dot at position (456, 152).
; PLAN: r0=350(x), r1=150(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=160(y), r7=85(width), r8=23(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=456(x), r11=152(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 350
LDI r1, 150
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 160
LDI r7, 85
LDI r8, 23
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 152
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
