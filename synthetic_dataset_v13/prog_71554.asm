; DESCRIPTION: Places a cyan line segment connecting (42, 151) to (449, 153).
; PLAN: r0=42(x1), r1=151(y1), r2=449(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 151
LDI r2, 449
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
