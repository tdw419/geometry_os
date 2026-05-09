; DESCRIPTION: Draws a cyan line from (473, 24) to (76, 16).
; PLAN: r0=473(x1), r1=24(y1), r2=76(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 24
LDI r2, 76
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
