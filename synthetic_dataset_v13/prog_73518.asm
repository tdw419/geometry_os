; DESCRIPTION: Places a white 103x108 rectangle at position (386, 98).
; PLAN: r0=386(x), r1=98(y), r2=103(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 98
LDI r2, 103
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
