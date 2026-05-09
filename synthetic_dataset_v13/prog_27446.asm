; DESCRIPTION: Places a white 39x44 rectangle at position (346, 79).
; PLAN: r0=346(x), r1=79(y), r2=39(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 79
LDI r2, 39
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
