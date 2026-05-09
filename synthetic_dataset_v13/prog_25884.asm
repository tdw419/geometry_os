; DESCRIPTION: Draws a white line from (138, 27) to (488, 56).
; PLAN: r0=138(x1), r1=27(y1), r2=488(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 27
LDI r2, 488
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
