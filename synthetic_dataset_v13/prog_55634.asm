; DESCRIPTION: Renders a red box of size 41x42 starting at (164, 146).
; PLAN: r0=164(x), r1=146(y), r2=41(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 146
LDI r2, 41
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
