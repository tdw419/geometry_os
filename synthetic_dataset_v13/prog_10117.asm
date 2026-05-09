; DESCRIPTION: Renders a cyan box of size 30x38 starting at (411, 157).
; PLAN: r0=411(x), r1=157(y), r2=30(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 157
LDI r2, 30
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
