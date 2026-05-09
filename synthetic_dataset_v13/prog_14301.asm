; DESCRIPTION: Places a cyan line segment connecting (479, 48) to (139, 42).
; PLAN: r0=479(x1), r1=48(y1), r2=139(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 48
LDI r2, 139
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
