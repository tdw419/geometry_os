; DESCRIPTION: Places a white 120x111 rectangle at position (386, 23).
; PLAN: r0=386(x), r1=23(y), r2=120(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 23
LDI r2, 120
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
