; DESCRIPTION: Places a green 37x77 rectangle at position (400, 124).
; PLAN: r0=400(x), r1=124(y), r2=37(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 124
LDI r2, 37
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
