; DESCRIPTION: Places a white 99x111 rectangle at position (263, 50).
; PLAN: r0=263(x), r1=50(y), r2=99(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 50
LDI r2, 99
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
