; DESCRIPTION: Places a white line segment connecting (503, 42) to (499, 239).
; PLAN: r0=503(x1), r1=42(y1), r2=499(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 42
LDI r2, 499
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
