; DESCRIPTION: Places a black 94x109 rectangle at position (405, 117).
; PLAN: r0=405(x), r1=117(y), r2=94(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 117
LDI r2, 94
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
