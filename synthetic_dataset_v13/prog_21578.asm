; DESCRIPTION: Places a white 116x111 rectangle at position (229, 44).
; PLAN: r0=229(x), r1=44(y), r2=116(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 44
LDI r2, 116
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
