; DESCRIPTION: Places a white 68x61 rectangle at position (355, 27).
; PLAN: r0=355(x), r1=27(y), r2=68(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 27
LDI r2, 68
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
