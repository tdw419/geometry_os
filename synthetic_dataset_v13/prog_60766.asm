; DESCRIPTION: Renders a cyan box of size 38x52 starting at (176, 157).
; PLAN: r0=176(x), r1=157(y), r2=38(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 157
LDI r2, 38
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
