; DESCRIPTION: Draws a cyan line from (72, 245) to (48, 93).
; PLAN: r0=72(x1), r1=245(y1), r2=48(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 245
LDI r2, 48
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
