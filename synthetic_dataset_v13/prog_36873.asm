; DESCRIPTION: Draws a cyan line from (203, 50) to (292, 166).
; PLAN: r0=203(x1), r1=50(y1), r2=292(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 50
LDI r2, 292
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
