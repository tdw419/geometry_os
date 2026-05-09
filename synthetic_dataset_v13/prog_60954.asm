; DESCRIPTION: Places a white 73x27 rectangle at position (246, 209).
; PLAN: r0=246(x), r1=209(y), r2=73(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 209
LDI r2, 73
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
