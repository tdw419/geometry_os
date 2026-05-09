; DESCRIPTION: Places a yellow 120x77 rectangle at position (18, 117).
; PLAN: r0=18(x), r1=117(y), r2=120(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 117
LDI r2, 120
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
