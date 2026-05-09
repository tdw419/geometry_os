; DESCRIPTION: Renders a cyan box of size 38x81 starting at (409, 30).
; PLAN: r0=409(x), r1=30(y), r2=38(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 30
LDI r2, 38
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
