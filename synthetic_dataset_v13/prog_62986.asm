; DESCRIPTION: Places a white 79x30 rectangle at position (405, 132).
; PLAN: r0=405(x), r1=132(y), r2=79(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 132
LDI r2, 79
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
