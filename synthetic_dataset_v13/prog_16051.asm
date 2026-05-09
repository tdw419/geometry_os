; DESCRIPTION: Composite: Places a cyan line segment connecting (367, 120) to (205, 30) then Creates a magenta rectangular region at (42, 73) spanning 109 by 100 pixels.
; PLAN: r0=367(x1), r1=120(y1), r2=205(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=73(y), r7=109(width), r8=100(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 120
LDI r2, 205
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 73
LDI r7, 109
LDI r8, 100
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
