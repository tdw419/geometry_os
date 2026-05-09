; DESCRIPTION: Draws a cyan line from (356, 81) to (344, 166).
; PLAN: r0=356(x1), r1=81(y1), r2=344(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 81
LDI r2, 344
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
