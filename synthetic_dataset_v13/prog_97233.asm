; DESCRIPTION: Places a magenta line segment connecting (479, 42) to (252, 167).
; PLAN: r0=479(x1), r1=42(y1), r2=252(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 42
LDI r2, 252
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
