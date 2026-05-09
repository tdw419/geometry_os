; DESCRIPTION: Places a magenta line segment connecting (70, 82) to (42, 192).
; PLAN: r0=70(x1), r1=82(y1), r2=42(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 82
LDI r2, 42
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
