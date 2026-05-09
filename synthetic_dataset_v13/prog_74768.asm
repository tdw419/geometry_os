; DESCRIPTION: Places a white 31x61 rectangle at position (469, 154).
; PLAN: r0=469(x), r1=154(y), r2=31(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 154
LDI r2, 31
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
