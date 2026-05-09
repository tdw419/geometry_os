; DESCRIPTION: Draws a green line from (45, 27) to (295, 41).
; PLAN: r0=45(x1), r1=27(y1), r2=295(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 27
LDI r2, 295
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
