; DESCRIPTION: Places a white 48x44 rectangle at position (47, 165).
; PLAN: r0=47(x), r1=165(y), r2=48(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 165
LDI r2, 48
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
