; DESCRIPTION: Draws a cyan line from (356, 139) to (42, 0).
; PLAN: r0=356(x1), r1=139(y1), r2=42(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 139
LDI r2, 42
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
