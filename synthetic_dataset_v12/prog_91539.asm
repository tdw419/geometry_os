; DESCRIPTION: Renders a white box of size 27x56 starting at (400, 29).
; PLAN: r0=400(x), r1=29(y), r2=27(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 29
LDI r2, 27
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
