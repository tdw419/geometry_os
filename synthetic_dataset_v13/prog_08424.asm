; DESCRIPTION: Places a white 51x79 rectangle at position (316, 135).
; PLAN: r0=316(x), r1=135(y), r2=51(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 135
LDI r2, 51
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
