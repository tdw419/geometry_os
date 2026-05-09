; DESCRIPTION: Places a white 50x61 rectangle at position (295, 39).
; PLAN: r0=295(x), r1=39(y), r2=50(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 39
LDI r2, 50
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
