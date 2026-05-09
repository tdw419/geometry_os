; DESCRIPTION: Renders a cyan line between points (75, 132) and (284, 203).
; PLAN: r0=75(x1), r1=132(y1), r2=284(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 132
LDI r2, 284
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
