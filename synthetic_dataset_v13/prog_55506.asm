; DESCRIPTION: Places a white 99x90 rectangle at position (249, 132).
; PLAN: r0=249(x), r1=132(y), r2=99(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 132
LDI r2, 99
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
