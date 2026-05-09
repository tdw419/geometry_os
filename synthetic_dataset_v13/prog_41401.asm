; DESCRIPTION: Places a red line segment connecting (488, 209) to (367, 103).
; PLAN: r0=488(x1), r1=209(y1), r2=367(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 209
LDI r2, 367
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
