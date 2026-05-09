; DESCRIPTION: Places a yellow 24x23 rectangle at position (386, 50).
; PLAN: r0=386(x), r1=50(y), r2=24(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 50
LDI r2, 24
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
