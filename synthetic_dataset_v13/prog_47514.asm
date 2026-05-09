; DESCRIPTION: Places a white 111x52 rectangle at position (326, 31).
; PLAN: r0=326(x), r1=31(y), r2=111(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 31
LDI r2, 111
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
