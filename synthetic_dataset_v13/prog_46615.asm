; DESCRIPTION: Places a white 51x116 rectangle at position (335, 117).
; PLAN: r0=335(x), r1=117(y), r2=51(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 117
LDI r2, 51
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
