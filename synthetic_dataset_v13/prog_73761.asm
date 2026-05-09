; DESCRIPTION: Renders a white line between points (401, 126) and (128, 87).
; PLAN: r0=401(x1), r1=126(y1), r2=128(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 126
LDI r2, 128
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
