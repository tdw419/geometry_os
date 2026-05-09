; DESCRIPTION: Composite: Renders a cyan box of size 23x110 starting at (309, 12) then Places a magenta line segment connecting (346, 82) to (135, 126).
; PLAN: r0=309(x), r1=12(y), r2=23(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x1), r6=82(y1), r7=135(x2), r8=126(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 12
LDI r2, 23
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 82
LDI r7, 135
LDI r8, 126
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
