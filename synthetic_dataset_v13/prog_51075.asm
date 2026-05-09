; DESCRIPTION: Renders a cyan box of size 53x38 starting at (27, 172).
; PLAN: r0=27(x), r1=172(y), r2=53(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 172
LDI r2, 53
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
