; DESCRIPTION: Draws a black line from (446, 67) to (487, 182).
; PLAN: r0=446(x1), r1=67(y1), r2=487(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 67
LDI r2, 487
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
