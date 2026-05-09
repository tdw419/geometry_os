; DESCRIPTION: Renders a white box of size 87x90 starting at (422, 46).
; PLAN: r0=422(x), r1=46(y), r2=87(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 46
LDI r2, 87
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
