; DESCRIPTION: Places a white 111x116 rectangle at position (335, 13).
; PLAN: r0=335(x), r1=13(y), r2=111(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 13
LDI r2, 111
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
