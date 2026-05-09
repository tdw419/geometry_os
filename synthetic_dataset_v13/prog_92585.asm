; DESCRIPTION: Places a red line segment connecting (479, 177) to (42, 77).
; PLAN: r0=479(x1), r1=177(y1), r2=42(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 177
LDI r2, 42
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
