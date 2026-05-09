; DESCRIPTION: Renders a cyan box of size 82x52 starting at (198, 18).
; PLAN: r0=198(x), r1=18(y), r2=82(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 18
LDI r2, 82
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
