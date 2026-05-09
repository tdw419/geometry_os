; DESCRIPTION: Renders a yellow box of size 107x38 starting at (281, 82).
; PLAN: r0=281(x), r1=82(y), r2=107(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 82
LDI r2, 107
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
