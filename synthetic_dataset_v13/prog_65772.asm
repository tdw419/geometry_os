; DESCRIPTION: Renders a cyan box of size 56x38 starting at (12, 143).
; PLAN: r0=12(x), r1=143(y), r2=56(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 143
LDI r2, 56
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
