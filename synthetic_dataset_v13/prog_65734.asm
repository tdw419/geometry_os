; DESCRIPTION: Places a white 106x27 rectangle at position (94, 19).
; PLAN: r0=94(x), r1=19(y), r2=106(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 19
LDI r2, 106
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
