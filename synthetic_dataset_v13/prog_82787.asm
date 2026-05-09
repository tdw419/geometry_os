; DESCRIPTION: Renders a cyan line between points (488, 196) and (203, 108).
; PLAN: r0=488(x1), r1=196(y1), r2=203(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 196
LDI r2, 203
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
