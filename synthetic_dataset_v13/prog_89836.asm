; DESCRIPTION: Places a black 33x77 rectangle at position (80, 164).
; PLAN: r0=80(x), r1=164(y), r2=33(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 164
LDI r2, 33
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
