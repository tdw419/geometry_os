; DESCRIPTION: Places a white 107x82 rectangle at position (209, 144).
; PLAN: r0=209(x), r1=144(y), r2=107(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 144
LDI r2, 107
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
